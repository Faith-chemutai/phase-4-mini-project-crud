class Spice < ApplicationRecord
    def summary
        "#{name}: $#{price}"
      end
end
