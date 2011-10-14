require File.expand_path(File.dirname(__FILE__) + '/spec_helper.rb')

describe User do
  
  before(:each) do
    @user = User.create(
      :name            => 'Chirantan Rajhans',
      :work_experience => 3,
      :dob             => Date.parse("6th February 1986"),
      :about           => "_This text should appear italic_",
      :username        => "chirantan"
    ) 
  end
  
  
  it 'should extend name attribute with "first" and "last" methods' do
    @user.name.first.should == 'Chirantan'
    @user.name.last.should  == 'Rajhans'
  end
  
  it 'should extend work_experience attribute with "in_months" method' do
    @user.work_experience.in_months.should == 36
  end
  
  it 'should extend dob attribute with DateMethods module' do
    @user.dob.age.should == 25
  end
  
  it 'should have to_hml method on about attribute' do
    @user.about.should == "_This text should appear italic_"
    @user.about.to_html.should == "<p><em>This text should appear italic</em></p>\n"
  end
  
  it 'should check if the username is a valid social network username' do
    @user.username.should == 'chirantan'
    @user.username.to_twitter.should == 'http://www.twitter.com/chirantan'
    @user.username.on_twitter?.should be_true
    @another_user = User.new(@user.attributes.update({:username => 'aaaaaaaaaaaaaaaa'}))
    @another_user.username.on_twitter?.should be_false
    @yet_another_user = User.new(@user.attributes.update({:username => 'chirantan.rajhans'}))
    @yet_another_user.username.to_facebook.should == 'http://www.facebook.com/chirantan.rajhans'
  end
  
end

