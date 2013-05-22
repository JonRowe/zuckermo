describe "Accessing a Facebook account" do
  extend Bacon::Functional::API

  before do
    self.window = UIApplication.sharedApplication.keyWindow
  end

  it 'allows us to retrieve the users name' do
    wait 1 do
      tap 'ok'
    end
    wait 1 do
      view('username').text.should.equal ENV['USER']
    end
  end

end
