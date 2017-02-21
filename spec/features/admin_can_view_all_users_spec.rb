require 'rails_helper'

describe 'When an admin visits /admin/users' do
  describe 'as an admin' do
    it 'they can see a list of users' do
      admin = User.create(username: 'Admin',
                          password: 'password',
                          role: 1)
      default = User.create(username: 'Default',
                            password: 'password',
                            role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit '/admin/users'

      expect(page).to have_content("Admin")
      expect(page).to have_content("Default")
    end
  end

  describe 'as a default' do
    it 'they see a 404' do
      user = User.create(username: 'Default',
                          password: 'password',
                          role: 0)
      User.create(username: 'Admin',
                            password: 'password',
                            role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/admin/users'

      expect(page).to_not have_content("Admin")
      expect(page).to_not have_content("Default")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
