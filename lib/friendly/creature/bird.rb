module Friendly
    class Creature
        class Bird < Base
            flexible :bird
            
            class << self

                def common_family_name
                    fetch('creature.bird.common_family_name')
                end

                def order
                    orders = I18n.translate('friendly.creature.bird.order_common_map').keys
                    sample(orders).to_s
                end

                def anatomy
                    fetch('creature.bird.anatomy')
                end

                def anatomy_past_tense
                    fetch('creature.bird.anatomy_past_tense')
                end

                def geo
                    fetch('creature.bird.geo')
                end

                def color
                    fetch('creature.bird_colors')
                end

                def adjective
                    fetch('creature.bird.adjectives')
                end

                def emotional_adjective
                    fetch('creature.bird.emotional_adjective')
                end

                def silly_adjective
                    fetch('creature.bird.silly_adjective')
                end

                def common_name(tax_order = nil)
                    map = translate('faker.creature.bird.order_common_map')
                    if tax_order.nil?
                        sample(map.values.flatten).downcase
                    else
                        raise TypeError, 'tax_order parameter must be symbolizable' \
                            unless tax_order.respond_to?(:to_sym)
                        raise ArgumentError, "#{tax_order} is not a valid taxonomic order" \
                            unless map.keys.include?(tax_order.to_sym)

                        the_order = translate('friendly.creature.bird.order_common_map')[tax_order.to_sym]
                        sample(the_order).downcase
                            end
                        end

                def plausible_common_name
                    parse('creature.bird.plausible_common_names').capitalize
                end

                def implausible_common_name
                    parse('creature.bird.implausible_common_names').capitalize
                end

                def order_with_common_name(tax_order = nil)
                    map = I18n.translate('friendly.creature.bird.order_common_map')
                    o = tax_order.nil? ? order : tax_order
                    { order: o, common_name: sample(map[o.to_sym]) }
                end
            end
        end
    end
end
