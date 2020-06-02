# Load RSpec and Capybara
require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'

# Configure RSpec
RSpec.configure do |config|
  # Mixin the Capybara functionality into Rspec
  config.include Capybara::DSL
  config.order = 'default'
end

# Define the application we're testing
def app
  # Load the application defined in config.ru
  Rack::Builder.parse_file('config.ru').first
end

# Configure Capybara to test against the application above.
Capybara.app = app



describe "POST '/greet' - User Greeting" do
  it 'greets the user personally based on their user_name in the form' do
    visit '/'

    fill_in(:user_name, :with => "Avi")
    click_button "Submit"

    expect(page).to have_text("Hi Avi, nice to meet you!")
  end
end
