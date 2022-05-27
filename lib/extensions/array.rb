class Array
    def rand
        self[Kernel.rand(length)]
    end

    def shuffle
        self.sort_by { rand }
    end
end
