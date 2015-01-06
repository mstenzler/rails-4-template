module FriendlyTitleHelper

  def self.included(base)
    base.extend FriendlyId
    base.friendly_id :slug_candidates, use: :slugged
#    base.send :include, InstanceMethods
  end

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :title,
      [:title, ->{ rand 1000 }]
    ]
  end

end
