Given(/^an individual session with an avatar which has one failing and one passing test$/) do
  step 'I have created an individual kata'
  @context['short_kata_id'] = @context['individual_short_kata_id']
  @context['avatar_1'] = @context['individual_avatar']

  step 'I run a failing test'
  step 'I run a passing test'
end

And(/^a participant has one failing and one passing test$/) do
  @context['group_participant_count'] ||= 0
  @context['group_participant_count'] += 1

  browser.restart
  step 'I join the group kata'
  step 'I run a failing test'
  step 'I run a passing test'

  @context['avatar_' + @context['group_participant_count'].to_s] = avatar
end

And(/^another participant has one failing test$/) do
  @context['group_participant_count'] ||= 0
  @context['group_participant_count'] += 1

  browser.restart
  step 'I join the group kata'
  step 'I run a failing test'

  @context['avatar_' + @context['group_participant_count'].to_s] = avatar
end
