Feature: User views group
  As a Loomio user
  So that I can see what groups are discussing
  I want to see all the public discussions belonging to a group

Background:
  Given I am logged in

@javascript
Scenario: Visitor views public group
  Given a public group exists
  And the group has a discussion
  When I visit the group page
  Then I should see the discussion title

@javascript
Scenario: Group member views public group
  Given I am a member of a public group
  And the group has discussions
  When I visit the group page
  Then I should see the group's discussions

@javascript
Scenario: Visitor views a public sub-group
  Given a public sub-group exists
  And the sub-group has discussions
  When I visit the sub-group page
  Then I should see the sub-group's discussions
  When I visit the parent-group page
  Then I should see the sub-group's discussions

@javascript
Scenario: Sub-group member views public sub-group
  Given I am a member of a public sub-group
  And the sub-group has discussions
  When I visit the sub-group page
  Then I should see the sub-group's discussions
  When I visit the parent-group page
  Then I should see the sub-group's discussions

@javascript
Scenario: Sub-group member views visible-to-parent sub-group
  Given I am a member of a sub-group viewable by parent-group members
  And the sub-group has discussions
  When I visit the sub-group page
  Then I should see the sub-group's discussions


@javascript
Scenario: Parent-group member views sub-group viewable by parent-group members
  Given I am a member of a parent-group that has a sub-group viewable by parent-group members
  And the sub-group has discussions
  When I visit the sub-group page
  Then I should see the sub-group's discussions

@javascript
Scenario: Parent-group member does not see sub-groups they don't belong to
  Given I am a member of a parent-group that has sub-groups I don't belong to
  And those sub-groups have discussions
  When I visit the parent-group page
  Then I should not see those sub-groups' discussions

@javascript
Scenario: Parent-group non-member tries to view sub-group viewable by parent-group members
  Given I am not a member of a parent-group that has a sub-group viewable by parent-group members
  And the sub-group has discussions
  When I visit the sub-group page
  Then I should not see the sub-group's discussions
