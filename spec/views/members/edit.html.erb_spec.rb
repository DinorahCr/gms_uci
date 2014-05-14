require 'spec_helper'

describe "members/edit" do
  before(:each) do
    @member = assign(:member, stub_model(Member,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", member_path(@member), "post" do
      assert_select "input#member_title[name=?]", "member[title]"
      assert_select "textarea#member_body[name=?]", "member[body]"
    end
  end
end
