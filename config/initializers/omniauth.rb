Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ucamraven, 2, "/Users/charlie/Downloads/pubkey2", {desc: 'Fitz JCR Housing Ballot System', msg: 'you need to verify which member of the college you are', iact: 'yes'}
end
