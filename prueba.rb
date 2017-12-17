h.each_pair { |val| val.delete_if(&:blank?) }
h.delete_if { |_key, value| value.empty? }
