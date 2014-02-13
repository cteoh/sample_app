require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  
  subject { page }
  describe "Home page" do
    before {visit root_path}

    it { should have_content('Sample App') }
    it { should have_title("Ruby on Rails Tutorial Sample App") }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before {visit help_path}

    it { should have_content('Help') }
    it { should have_title("#{base_title} | Help") }
  end

  describe "About page" do
    before {visit about_path}

    it { should have_content('About Us') }
    it {should have_title("#{base_title} | About Us") }
  end

  describe "Contact page" do
    before {visit contact_path}

    it { should have_selector('h1', text: 'Contact') }
    it { should have_title("#{base_title} | Contact") }
  end

  it "should have the right links on layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title("#{base_title} | About Us")
    click_link "Help"
    expect(page).to have_title("#{base_title} | Help") # fill in
    click_link "Contact"
    expect(page).to have_title("#{base_title} | Contact") # fill in
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title("#{base_title} | Sign up") # fill in
    click_link "sample app"
    expect(page).to have_title("Ruby on Rails Tutorial Sample App") # fill in
  end

end
