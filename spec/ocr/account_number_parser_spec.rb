require 'spec_helper'

describe OCR::AccountNumberParser do

  describe '#parse' do

    examples = {
      [0,0,0,0,0,0,0,0,0] => %Q(
 _  _  _  _  _  _  _  _  _ 
| || || || || || || || || |
|_||_||_||_||_||_||_||_||_|

    ),
    [1,1,1,1,1,1,1,1,1] => %Q(
                           
  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |

    ),
    [2,2,2,2,2,2,2,2,2] => %Q(
 _  _  _  _  _  _  _  _  _ 
 _| _| _| _| _| _| _| _| _|
|_ |_ |_ |_ |_ |_ |_ |_ |_ 

    ),
    [3,3,3,3,3,3,3,3,3] => %Q(
 _  _  _  _  _  _  _  _  _ 
 _| _| _| _| _| _| _| _| _|
 _| _| _| _| _| _| _| _| _|
    ),
    [4,4,4,4,4,4,4,4,4] => %Q(
                           
|_||_||_||_||_||_||_||_||_|
  |  |  |  |  |  |  |  |  |
    ),
    [5,5,5,5,5,5,5,5,5] => %Q(
 _  _  _  _  _  _  _  _  _ 
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
 _| _| _| _| _| _| _| _| _|

    ),
    [6,6,6,6,6,6,6,6,6] => %Q(
 _  _  _  _  _  _  _  _  _ 
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
|_||_||_||_||_||_||_||_||_|
    ),
    [7,7,7,7,7,7,7,7,7] => %Q(
 _  _  _  _  _  _  _  _  _ 
  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |
    ),
    [8,8,8,8,8,8,8,8,8] => %Q(
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
|_||_||_||_||_||_||_||_||_|
    ),
    [9,9,9,9,9,9,9,9,9] => %Q(
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
 _| _| _| _| _| _| _| _| _|
    ),
    [1,2,3,4,5,6,7,8,9] => %Q(
    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|
    )
    }

    examples.each do |expected_account_number, example|

      context "For the following input: #{example}" do
        subject { OCR::AccountNumberParser.new(example) }

        it 'returns an array representing the digits of the account number' do
          subject.parse.should == expected_account_number
        end
      end

    end

  end

end

