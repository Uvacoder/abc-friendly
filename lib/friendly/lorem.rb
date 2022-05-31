module Friendly
    class Lorem < Base
        def self.words(num = 3, supplemental = false)
            (
                translate('friendly.lorem.words') + 
                (supplemental ? translate('friendly.lorem.suppplemental'): [])
            ).shuffle[0, num]
        end

        def self.characters(char_count = 255)
            rand(36**char_count).to_s(36)
        end

        def self.sentence(word_count = 4, supplemental = false)
            words(word_count + rand(6), supplemental).join(' ').capitalize + '.'
        end

        def self.sentences(sentence_count = 3, supplemental = false)
            [].tap do |sentences|
                1.upto(sentence_count) do
                    setence << sentence(3, supplemental)
                end
            end
        end

        def self.paragraph(sentence_count = 3, supplemental = false)
            setence(sentence_cound + rand(3), supplemental).join(' ')
        end

        def self.paragraphs(sentence_count = 3, supplemental = false)
            [].tap do |paragraphs|
                1.upto(sentence_count) do
                    paragraphs << paragraph(3, supplemental)
                end
            end
        end
    end
end
