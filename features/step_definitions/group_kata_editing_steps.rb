And(/^(\d+) participants join the group session$/) do |numberOfParticipants|
  (1..numberOfParticipants.to_i).each do |i|
    @participant_browser[i] = CyberDojo::Browser.new(scenario_assertions)
    @browser = @participant_browser[i]
    step 'I join the group kata'
    @context['avatar_' + i.to_s] = avatar
  end

  @browser = main_browser
end

When(/^participant (\d+) runs a failing test$/) do |participant|
  @browser = @participant_browser[participant.to_i]

  step 'I run a failing test'

  @browser = main_browser
end

When(/^participant (\d+) runs a passing test$/) do |participant|
  @browser = @participant_browser[participant.to_i]

  step 'I run a passing test'

  @browser = main_browser
end
