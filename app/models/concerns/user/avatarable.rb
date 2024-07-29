module User::Avatarable
  extend ActiveSupport::Concern

  included do
    has_one_attached :avatar
  end

  def avatar_or_default
    return avatar if avatar.attached?

    "default_avatar"
  end
end
