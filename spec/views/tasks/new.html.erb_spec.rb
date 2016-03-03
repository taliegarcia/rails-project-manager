require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :name => "MyString",
      :description => "MyText",
      :status => "MyString",
      :references => ""
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "textarea#task_description[name=?]", "task[description]"

      assert_select "input#task_status[name=?]", "task[status]"

      assert_select "input#task_references[name=?]", "task[references]"
    end
  end
end
