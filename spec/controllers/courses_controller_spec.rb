require 'rails_helper'

if RUBY_VERSION>='2.6.0'
if Rails.version < '5'
class ActionController::TestResponse < ActionDispatch::TestResponse
def recycle!
# hack to avoid MonitorMixin double-initialize error:
@mon_mutex_owner_object_id = nil
@mon_mutex = nil
initialize
end
end
else
puts "Monkeypatch for ActionController::TestResponse no longer needed"
end
end

RSpec.describe CoursesController, type: :controller do
    
 describe 'GET#index' do
    it 'returns a succes response' do
      get :index
      expect(response).to be_success
    end
  end  
   
 describe 'GET#Show' do
  before do
    Course.create(:course_num => 'C1', :dept => 'Computer Science', :course_name => 'Intro to Computer Science', :professor => 'Adam Cannon', :requirement => 'Major Core', :course_time => 'TR 4:10pm-5:25pm')
    Coursedetails.create(:number => 'C1', :points => '3', :coursetype =>'LECTURE', :method_of_inst =>'Hybrid', :detail => '----------')
  end
  it 'should render the show template' do
    get :show, id: 1
    expect(response).to render_template('show')
  end   
 end
    
end
