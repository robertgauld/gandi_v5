# frozen_string_literal: true

# Namespace for classes which access LiveDNS details.
# @see https://api.gandi.net/docs/livedns/
class GandiV5
  # Gandi LiveDNS Management API.
  class LiveDNS
    # Permitted record types.
    RECORD_TYPES = %w[
      A AAAA CNAME MX NS TXT ALIAS
      WKS SRV LOC SPF CAA DS SSHFP PTR KEY DNAME TLSA OPENPGPKEY CDS
    ].freeze

    # @see GandiV5::LiveDNS::Domain.fetch
    def self.domain(fqdn)
      GandiV5::LiveDNS::Domain.fetch(fqdn)
    end

    # @see GandiV5::LiveDNS::Domain.list
    def self.domains
      GandiV5::LiveDNS::Domain.list
    end

    # Raise an error if passed type is invalid.
    # @param type [String] the record type to check.
    # @return [nil]
    # @raise [ArgumentError]
    # rubocop:disable Style/GuardClause
    def self.require_valid_record_type(type)
      unless RECORD_TYPES.include?(type)
        fail ArgumentError, "type must be one of #{RECORD_TYPES.join(', ')}"
      end
    end
    # rubocop:enable Style/GuardClause
  end
end
