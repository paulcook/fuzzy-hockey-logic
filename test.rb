#!/usr/bin/env ruby

$:.push File.expand_path('lib/', __FILE__)
require "fuzzy_associative_memery"

implication = :mamdani

ice_location = FuzzyAssociativeMemory::LinguisticVariable.new("location on ice")
behind_own_goal = FuzzyAssociativeMemory::Triangle.new(0,1,2)
defensive_zone = FuzzyAssociativeMemory::Triangle.new(1,2,3)
neutral_zone = FuzzyAssociativeMemory::Triangle.new(2,3,4)
offensize_zone = FuzzyAssociativeMemory::Triangle.new(3,4,5)
behind_opp_goal = FuzzyAssociativeMemory::Triangle.new(4,5,6)
ice_location.sets = [behind_own_goal, defensive_zone, neutral_zone, offensize_zone, behind_opp_goal]


energy_level = FuzzyAssociativeMemory::LinguisticVariable.new("current energy level")
low_energy = FuzzyAssociativeMemory::Trapezoid.new(0,0,40,50)
moderate_energy = FuzzyAssociativeMemory::Trapezoid.new(40,50,60,70)
high_energy = FuzzyAssociativeMemory::Trapezoid.new(60,70,100,100)
energy_level.sets = [low_energy, moderate_energy, high_energy]

defensive_state = FuzzyAssociativeMemory::LinguisticVariable.new("current defensive state")
no_defense = FuzzyAssociativeMemory::Trapezoid.new(0,0,20,40)
moderate_defense = FuzzyAssociativeMemory::Trapezoid.new(30,50,60,70)
loaded_defense = FuzzyAssociativeMemory::Trapezoid.new(60,80,100,100)
defensive_state.sets = [no_defense, moderate_defense, loaded_defense]

desirability = FuzzyAssociativeMemory::LinguisticVariable.new('shot desirability')
undesirable = FuzzyAssociativeMemory::Trapezoid.new(0,0,30,50)
desirable = FuzzyAssociativeMemory::Triangle.new(30,50,70)
very_desirable = FuzzyAssociativeMemory::Trapezoid.new(50,80,100,100)
desirability.sets = [undesirable, desirable, very_desirable]

shot_ruleset = FuzzyAssociativeMemory::Ruleset.new('Take shot desirability', implication)

# Behind Own Goal
shot_rule1 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, low_energy, no_defense], :and, undesirable, "If behind own goal and tired and no defense, do not take a shot")
shot_rule2 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, low_energy, moderate_defense], :and, undesirable, "If behind own goal and tired and some defense, do not take a shot")
shot_rule3 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, low_energy, loaded_defense], :and, undesirable, "If behind own goal and tired and loaded defense, do not take a shot")

shot_rule1 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, moderate_energy, no_defense], :and, undesirable, "If behind own goal and not tired and no defense, do not take a shot")
shot_rule2 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, moderate_energy, moderate_defense], :and, undesirable, "If behind own goal and not tired and some defense, do not take a shot")
shot_rule3 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, moderate_energy, loaded_defense], :and, undesirable, "If behind own goal and not tired and loaded defense, do not take a shot")

shot_rule1 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, high_energy, no_defense], :and, undesirable, "If behind own goal and high energy and no defense, do not take a shot")
shot_rule2 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, high_energy, moderate_defense], :and, undesirable, "If behind own goal and high energy and some defense, do not take a shot")
shot_rule3 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, high_energy, loaded_defense], :and, undesirable, "If behind own goal and high energy and loaded defense, do not take a shot")

#Defensive Zone
shot_rule1 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, low_energy, no_defense], :and, undesirable, "If behind own goal and tired and no defense, do not take a shot")
shot_rule2 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, low_energy, moderate_defense], :and, undesirable, "If behind own goal and tired and some defense, do not take a shot")
shot_rule3 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, low_energy, loaded_defense], :and, undesirable, "If behind own goal and tired and loaded defense, do not take a shot")

shot_rule1 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, moderate_energy, no_defense], :and, undesirable, "If behind own goal and not tired and no defense, do not take a shot")
shot_rule2 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, moderate_energy, moderate_defense], :and, undesirable, "If behind own goal and not tired and some defense, do not take a shot")
shot_rule3 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, moderate_energy, loaded_defense], :and, undesirable, "If behind own goal and not tired and loaded defense, do not take a shot")

shot_rule1 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, high_energy, no_defense], :and, undesirable, "If behind own goal and high energy and no defense, do not take a shot")
shot_rule2 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, high_energy, moderate_defense], :and, undesirable, "If behind own goal and high energy and some defense, do not take a shot")
shot_rule3 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, high_energy, loaded_defense], :and, undesirable, "If behind own goal and high energy and loaded defense, do not take a shot")

# Neutral Zone
shot_rule1 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, low_energy, no_defense], :and, undesirable, "If behind own goal and tired and no defense, do not take a shot")
shot_rule2 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, low_energy, moderate_defense], :and, undesirable, "If behind own goal and tired and some defense, do not take a shot")
shot_rule3 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, low_energy, loaded_defense], :and, undesirable, "If behind own goal and tired and loaded defense, do not take a shot")

shot_rule1 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, moderate_energy, no_defense], :and, undesirable, "If behind own goal and not tired and no defense, do not take a shot")
shot_rule2 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, moderate_energy, moderate_defense], :and, undesirable, "If behind own goal and not tired and some defense, do not take a shot")
shot_rule3 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, moderate_energy, loaded_defense], :and, undesirable, "If behind own goal and not tired and loaded defense, do not take a shot")

shot_rule1 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, high_energy, no_defense], :and, undesirable, "If behind own goal and high energy and no defense, do not take a shot")
shot_rule2 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, high_energy, moderate_defense], :and, undesirable, "If behind own goal and high energy and some defense, do not take a shot")
shot_rule3 = FuzzyAssociativeMemory::Rule.new([behind_own_goal, high_energy, loaded_defense], :and, undesirable, "If behind own goal and high energy and loaded defense, do not take a shot")



shot_ruleset.rules = []

shot_desirability = shot_ruleset.calculate(location, energy, defensive_rating)
puts "#{shot_ruleset.name}: for #{ice_location.anem} #{locaiton} and #{energy_level.name} #{energy} and #{defensive_state.name} #{defensive_rating} the #{desirability.name} is #{shot_desirability}"
