Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '446896192164732', '8950e98d7574ea9e000ff527c87583e7', {scope: 'manage_pages publish_pages publish_actions'}
  provider :twitter, 'SJTVmZBRzUC9QdZXbOfZgA', 'f2oaYS2jLA6ruDi8lYsHGpNKxw1kcqsUsPiSpNstURQ'
end
