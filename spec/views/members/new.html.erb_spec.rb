require 'spec_helper'

describe "members/new" do
  before(:each) do
    assign(:member, stub_model(Member,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", members_path, "post" do
      assert_select "input#member_title[name=?]", "member[title]"
      assert_select "textarea#member_body[name=?]", "member[body]"
    end
  end
end
