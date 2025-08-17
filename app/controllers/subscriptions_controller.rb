class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[ show edit update destroy ]

  # GET /subscriptions or /subscriptions.json
  def index
    @subscriptions = Subscription.all
  end

  # GET /subscriptions/1 or /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @client = Client.find(params[:client_id])
    @subscription = @client.build_subscription
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions or /subscriptions.json
  def create
    @client = Client.find(params[:client_id])
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        create_bills_for_subscription(@subscription)

        format.html { redirect_to @subscription, notice: "Subscription was successfully created." }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1 or /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: "Subscription was successfully updated." }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1 or /subscriptions/1.json
  def destroy
    @client = @subscription.client
    @subscription.destroy!

    respond_to do |format|
      format.html { redirect_to client_path(@client), status: :see_other, notice: "Subscription was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def subscription_params
      params.expect(subscription: [ :client_id, :package_id, :plan_id, :additionals_id ])
    end

    # Create 12 bills for each item of subscription (plan, package and additionals)
    def create_bills_for_subscription(subscription)
      12.times do |month_offset|
        due_date = Date.current.next_month(month_offset + 1)

        if subscription.plan.present?
          Bill.create!(
            subscription: subscription,
            bill_type: "plan",
            amount: subscription.plan.price,
            due_date: due_date
          )
        elsif subscription.package.present?
          Bill.create!(
            subscription: subscription,
            bill_type: "package",
            amount: subscription.package.price,
            due_date: due_date
          )
        end

        subscription.additionals.each do |additional|
          Bill.create!(
            subscription: subscription,
            bill_type: "additional",
            additional: additional,
            amount: additional.price,
            due_date: due_date
          )
        end
      end
    end

end
