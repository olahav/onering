require 'spec_helper'

describe "worklogs/index.html.haml" do
  before(:each) do
    assign(:worklogs, Kaminari.paginate_array([
      stub_model(Worklog,
        :name => "Name"
      ),
      stub_model(Worklog,
        :name => "Name"
      )
    ]).page(1))
  end

  it "renders a list of worklogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
