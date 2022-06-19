module Friendly
    class Book < Base
        flexible :Book
        
        class << self

            def title
                fetch('book.title')
            end

            def author
                parse('book.author')
            end
            
            def publisher
                fetch('book.publisher')
            end

            def genre
                fetch('book.genre')
            end
        end
    end
end
