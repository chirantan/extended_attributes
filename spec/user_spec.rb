require File.expand_path(File.dirname(__FILE__) + '/spec_helper.rb')

describe User do
  
  before(:each) do
    @user = User.create(
      :name            => 'Chirantan Rajhans',
      :work_experience => 3,
      :dob             => Date.parse("6th February 1986")
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
  
end
  