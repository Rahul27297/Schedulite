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
  course1 = {}
  before do
    Course.create(:id => 555, :course_num => 'C1', :dept => 'Computer Science', :course_name => 'Intro to Computer Science', :professor => 'Adam Cannon', :requirement => 'Major Core', :course_time => 'TR 4:10pm-5:25pm')
    Coursedetails.create(:number => 'C1', :points => '3', :coursetype =>'LECTURE', :method_of_inst =>'Hybrid', :detail => '----------')
  end
  it 'should render the show template' do
    get :show, id: 555
    expect(response).to render_template('show')
  end   
 end
    
 describe 'POST#add_to_cart' do
  before do
    Course.create(:course_num => 'C1', :dept => 'Computer Science', :course_name => 'Intro to Computer Science', :professor => 'Adam Cannon', :requirement => 'Major Core', :course_time => 'TR 4:10pm-5:25pm')
    Course.create(:course_num => 'C2', :dept => 'Computer Science', :course_name => 'Data Structures in Java', :professor => 'Paul B', :requirement => 'Major Core', :course_time => 'MW 4:10pm-5:25pm')
    Course.create(:course_num => 'C3', :dept => 'Computer Science', :course_name => 'Computer Networks', :professor => 'Henning S', :requirement => 'Major Core', :course_time => 'MW 4:10pm-5:25pm')
    Course.create(:course_num => 'C4', :dept => 'Computer Science', :course_name => 'Test-1', :professor => 'Henning S', :requirement => 'Major Core', :course_time => 'MW 4:10pm-5:25pm')
    Course.create(:course_num => 'C5', :dept => 'Computer Science', :course_name => 'Test-2', :professor => 'Henning S', :requirement => 'Major Core', :course_time => 'MW 4:10pm-5:25pm')
    Course.create(:course_num => 'C6', :dept => 'Computer Science', :course_name => 'Test-3', :professor => 'Henning S', :requirement => 'Major Core', :course_time => 'MW 4:10pm-5:25pm')
    Course.create(:course_num => 'C7', :dept => 'Computer Science', :course_name => 'Test-4', :professor => 'Henning S', :requirement => 'Major Core', :course_time => 'MW 4:10pm-5:25pm')
  end
  it 'adds records C1, C2 to cart table' do
      expect {post :add_to_cart, "addCart"=>{"C1"=>"1", "C2"=>"1"}}.to change { Cart.count }.by(2)
  end
  it 'removes all records and adds C1 to cart table' do
      expect {post :add_to_cart, "addCart"=>{"C1"=>"1"}}.to change { Cart.count }.by(1)
  end
  it 'again removes all and adds records to cart table' do
      expect {post :add_to_cart, "addCart"=>{"C1"=>"1", "C2"=>"1", "C3"=>"1"}}.to change { Cart.count }.by(3)
  end     
  it 'should render the add_to_cart template' do
    post :add_to_cart, "addCart"=>{"C1"=>"1", "C2"=>"1"}
    expect(response).to render_template('add_to_cart')
  end
  it 'should have overlap message in flash' do
    post :add_to_cart, "addCart"=>{"C1"=>"1", "C2"=>"1", "C3"=>"1"}
    expect(flash[:colormessage]).to eq "There is an overlap between courses indicated by warning symbols. Please go back to course listing page and remove the courses from the cart."
  end
  it 'should have Cart size greater message in flash' do
    post :add_to_cart, "addCart"=>{"C1"=>"1", "C2"=>"1", "C3"=>"1", "C4"=>"1", "C5"=>"1", "C6"=>"1", "C7"=>"1"}
    expect(flash[:message]).to eq "Cart size is cannot be greater than 6. Please limit the courses."
  end
  it 'should have Nothing to add message in flash' do
    post :add_to_cart
    expect(flash[:message]).to eq "Nothing to add."
  end   
 end
    
end
