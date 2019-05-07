Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_Em2S3ZfNcLAtbisihLDg4sDv00gdorfcYP'],
  :secret_key      => ENV['sk_test_cfw9DcLlPietT8IZuIlXwZAd00iFuk0Aeo']
}

Stripe.api_key = Rails.configuration.stripe[:sk_test_cfw9DcLlPietT8IZuIlXwZAd00iFuk0Aeo]