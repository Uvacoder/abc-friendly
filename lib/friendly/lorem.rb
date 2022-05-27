module Friendly
    class Lorem
        def self.words(num = 3)
            I18n.translate('lorem.words').shuffle[0, num]
        end

        def self.sentence(sentence_count = 3)
            [].tap do |sentences|
                1.upto(sentence_count) do
                    sentences << sentence
                end
            end
        end

        def self.paragraph(sentence_count = 3)
            sentences(sentence_count + rand(3)).join(' ')
        end

        def self.paragraphs(paragraph_count = 3)
            [].tap do |paragraphs|
                1.upto(paragraph_count) do
                  paragraphs << paragraph
                end
            end
        end
    end
end
