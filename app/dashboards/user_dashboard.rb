require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    comments: Field::HasMany,
    favorites: Field::HasMany,
    recieve_points: Field::HasMany.with_options(class_name: "PointReciever"),
    active_notifications: Field::HasMany.with_options(class_name: "Notification"),
    passive_notifications: Field::HasMany.with_options(class_name: "Notification"),
    follower: Field::HasMany.with_options(class_name: "Relationship"),
    followed: Field::HasMany.with_options(class_name: "Relationship"),
    following_user: Field::HasMany.with_options(class_name: "User"),
    follower_user: Field::HasMany.with_options(class_name: "User"),
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    last_sign_in_ip: Field::String,
    name: Field::String,
    point_count: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  comments
  favorites
  recieve_points
  active_notifications
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  comments
  favorites
  recieve_points
  active_notifications
  passive_notifications
  follower
  followed
  following_user
  follower_user
  id
  email
  encrypted_password
  reset_password_token
  reset_password_sent_at
  remember_created_at
  sign_in_count
  current_sign_in_at
  last_sign_in_at
  current_sign_in_ip
  last_sign_in_ip
  name
  point_count
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  comments
  favorites
  recieve_points
  active_notifications
  passive_notifications
  follower
  followed
  following_user
  follower_user
  email
  encrypted_password
  reset_password_token
  reset_password_sent_at
  remember_created_at
  sign_in_count
  current_sign_in_at
  last_sign_in_at
  current_sign_in_ip
  last_sign_in_ip
  name
  point_count
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
