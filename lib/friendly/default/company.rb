module Friendly
    class Company < Base
        flexible :company

        class << self
            def name
                parse('company.name')
            end

            def suffix
                fetch('company.suffix')
            end

            def catch_phrase
                translate('friendly.company.buzzwods').collect {|list| list.sample}.join(' ')
            end

            def bs
                translate('friendly.company.bs').collect {|list| list.sample}.join(' ')
            end
        end
    end
end
