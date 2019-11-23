require 'httparty'

class Rextester
  include HTTParty
  base_uri 'https://rextester.com'

  attr_reader :errors, :warnings, :result, :run_time, :mem_peak

  def initialize(lang_id: 12, code: '', input: '', compiler_args: '')
    @options = { 'LanguageChoice': lang_id,
                 'Program': code,
                 'Input': input,
                 'CompilerArgs': compiler_args }
  end

  def run
    response = request.parsed_response
    return if response['Errors'] == 'Too many requests...'

    @run_time = response['Stats'][23..25].to_f
    @mem_peak = response['Stats'][65..90].to_i

    @errors = response['Errors']
    @warnings = response['Warnings']
    @result = response['Result']
  end

  private

  def request
    self.class.post('/rundotnet/api', body: @options)
  end
end
