class OrderParser
  def self.call(payload)
    JSON.parse(payload)
  end
end