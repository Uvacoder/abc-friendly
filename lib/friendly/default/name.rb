module Friendly
    class Name < Base
        flexible :name

        class << self

            def name
                parse('name.name')
            end

            def first_name; fetch('name.first_name'); end
            def last_name;  fetch('name.last_name'); end
            def prefix;     fetch('name.prefix'); end
            def suffix;     fetch('name.suffix'); end

            def title; fetch('name.title.descriptor') + ' ' + fetch('name.title.level') + ' ' + fetch('name.title.job'); end
        end
    end
end
