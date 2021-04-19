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

RSpec.describe AuthenticationController, type: :controller do

 describe 'GET#login' do
  before do
    #allow(controller).to receive(:authenticate).and_return(true)    
    User.create(:username => 'admin', :password => '123')
  end
  it 'should redirect to courses_path' do
    get :login, username: "admin", password: "123"
    expect(response).to redirect_to courses_path
  end   
 end
 
 describe 'POST#logout' do
  before do
  end
  it 'should redirect to courses_path' do
    post :logout
    expect(response).to render_template('authentication/login')
  end   
 end   
end
