class Panda
  attr_accessor :name, :email, :gender, :friends
  def initialize(name, email, gender)
    @name = name
    @email = email
    @gender = gender
    @friends = []
  end

  def male?
    if gender == "male"
      true
    else false
    end
  end

  def female?
    if gender == "female"
      true
    else false
    end
  end

  def to_s(panda)
    "#{panda.name}, #{panda.email}, #{panda.gender}"
  end

  def ==(panda)
    name == panda.name && email == panda.email && gender == panda.gender
  end

  def hash
    panda.email.hash
  end
end

#require 'json'
require 'set'
class SocialNetwork
  attr_accessor :members
  def initialize
    @members = {}
  end

  def add_panda(panda)
    if members.include? panda
      raise PandaAlreadyThere, "This panda already exists in the network."
    else members[panda] = panda.friends
    end
  end

  def has_panda(panda)
    @members.key? panda
  end

  def make_friends(panda1, panda2)
    if !has_panda panda1
      add_panda panda1
    elsif !had_panda panda2
      add_panda panda2
    end

    if panda1.friends.include? panda2
      raise PandasAlreadyFriends, "These pandas are already friends"
    else
    panda1.friends.push(panda2)
    panda2.friends.push(panda1)
    end
  end

  def are_friends(panda1, panda2)
    panda1.friends.include? panda2
  end

  def friends_of panda
    if has_panda panda
      panda.friends
    else return false
    end
  end

  #def connection_level panda1, panda2
    #if has_panda panda1 == false or has_panda panda2 == false
     # return false
    #end
    #queue = []
    #level = 1
    #panda1.friends.each do |friend|
     # queue.push [friend, level]
    #end
    #visited = panda1.friends
    #if queue.empty?
     # return 0
    #end
    #while !queue.empty?
     # current_panda = queue.shift
      #current_panda.friends.each do |friend, level|
       # if !visited.include? friend
        #  queue.push[friend, level += 1]
         # visited.push(friend)
        #end
        #if friend == panda2
         # return level
        #end
    #end
    #return 0
   # bfs panda2 do |friend, level|
    #  if friend == panda2
     #   return level
     # end

  #end

  def bfs
    q = Queue.new
    visited = Set.new

    q << [0, panda]
    visited << panda

    until q.empty?
      level, current_panda = q.shift
      unvisited = @members[current_panda].select { |v| !visited.include? v }
      unvisited.each do |v|
        q << [level + 1, v]
        visited << v
      end
    end
  end


  def are_connected panda1, panda2
   # bfs(panda1) do |friend, level|
    #  return true if friend == panda2
    #end
    #false
    #if connection_level panda1, panda2 == false
     # false
    #else true
    #end
  end

  def how_many_gender_in_network level, panda, gender
    #queue = []
   # level = 1
    #count_pandas = 0
    #queue << panda
    #panda1.friends.each do |friend|
     # queue.push ([friend, level])
    #end
   # while !queue.empty?
    #  current_panda = queue.shift
     # current_panda.friends.each do |friend, current_level|
      #  if current_level < level
       #queue.push[friend, level += 1]
        #end
        #if friend.gender == gender
         # count_pandas += 1
        #end
      #end
    #end
    #count_pandas
  end

  def save(file_name)
    file_name = File.new("social_network.json", "w")
    file_name.puts members.to_json
  end



  def connection_level(panda1, panda2)
    return false unless @members.has_key panda1 and @members.has_key panda2
    count = 0
    queue = []
    queue[0] = [panda1]
    visited = []
    until queue.empty?
      current_level = []
      queue[count].each { |v| current_level << v }
      queue.shift
      current_level.each do |v|
        return count if v == panda2
        visited << v
        queue[count + 1] = @network[v]
      end

      count += 1
    end

    return -1
  end
end