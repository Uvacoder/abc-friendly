require 'openssl'
require 'securerandom'

module Friendly
    class Blockchain
        class Bitcoin < Base
            class << self

                PROTOCOL_VERSIONS = {
                    main: 0,
                    testnet: 111
                }.freeze

                def address
                    address_for(:main)
                end

                def testnet_address
                    address_for(:testnet)
                end
                
                protected
                
                def address_for(network)
                    version = PROTOCOL_VERSIONS.fetch(network)
                    packed = version.chr + Faker::Config.random.bytes(20)
                    checksum = OpenSSL::Digest::SHA256.digest(OpenSSL::Digest::SHA256.digest(packed))[0..3]
                    Friendly::Base58.encode(packed + checksum)
                end
            end
        end
    end
end