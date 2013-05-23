describe "Accessing a Facebook account" do
  extend Bacon::Functional::API

  before do
    self.window = UIApplication.sharedApplication.keyWindow
  end

  it 'allows us to retrieve the users name' do
    if Facebook.accounts.size > 0
      wait 1 do
        tap 'ok'
      end
      wait 1
      view('username').text.should.equal ENV['USER']
    else
      warn "\n\n!!!!!!!!!!!!!\n\n No acounts on simulator"
      view('username').text.should.equal 'Fail... See Log'
    end
  end

end
