class ProcessOrderError < StandardError
    def message
      "An Error Ocurred while trying to process order"
    end
end