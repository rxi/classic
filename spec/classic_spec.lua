Object = require "classic"

-- BaseClass provides a say() method
local BaseClass = Object:extend()
function BaseClass:new(name)
  self._name = name
end
function BaseClass:get_name()
  return self._name
end
function BaseClass.say_something()
  return "something"
end

-- ClassOne extends BaseClass
local ClassOne = BaseClass:extend()
function ClassOne:new(name)
  ClassOne.super.new(self, name)
end
function ClassOne.say_something()
  return "something better"
end

-- ClassTwo extends BaseClass
local ClassTwo = BaseClass:extend()
function ClassTwo:new(name)
  if name == "wrong" then
    error({message = "Wrong value"})
  end
  ClassTwo.super.new(self, name)
end

describe("classic #classic", function()
  describe("Base tests", function()

    it("Constructors should work", function()
      local class_one = ClassOne("Mark")
      local class_two = ClassTwo("John")

      assert.are.same("Mark", class_one:get_name())
      assert.are.same("John", class_two:get_name())
    end)
    it("Static method should work", function()
      local class_one = ClassOne("Mark")
      local class_two = ClassTwo("John")

      assert.are.same("something better", class_one:say_something())
      assert.are.same("something", class_two:say_something())
    end)
    it("Constructor returns error", function()
      local status, res = pcall(ClassTwo, "wrong")

      assert.falsy(status)
      assert.truthy(res)
      assert.are.same("Wrong value", res.message)
    end)

  end)
end)