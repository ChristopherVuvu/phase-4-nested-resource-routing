require 'rails_helper'

RSpec.describe 'Items', type: :request do
  describe 'GET /index' do
    it 'returns all items for a specific user' do
      # Create a user
      user = User.create(name: 'John Doe')

      # Create some items for the user
      item1 = Item.create(name: 'Non-stick pan', description: 'Sticks a bit', price: 10, user: user)
      item2 = Item.create(name: 'Ceramic plant pots', description: 'Plants not included', price: 31, user: user)

      # Make a GET request to /users/:user_id/items
      get "/users/#{user.id}/items"

      # Verify the response
      expect(response).to have_http_status(200)
      expect(response.body).to include(item1.to_json)
      expect(response.body).to include(item2.to_json)
    end
  end
end
