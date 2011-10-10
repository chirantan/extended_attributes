module DateMethods
  
  def age
    now = Time.now.utc.to_date
    now.year - self.year - ((now.month > self.month || (now.month == self.month && now.day >= self.day)) ? 0 : 1)
  end
  
end