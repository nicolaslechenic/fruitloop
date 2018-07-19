class FakeOutput < Array
  def puts(arg)
    push(arg.to_s << "\n")
  end
end
