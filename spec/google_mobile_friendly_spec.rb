require "spec_helper"

RSpec.describe GoogleMobileFriendly do
  describe ".run_test" do
    context 'for google.com' do
      before do
        response = '{
          "testStatus": {
            "status": "COMPLETE"
          },
          "mobileFriendliness": "MOBILE_FRIENDLY",
          "resourceIssues": [
            {
              "blockedResource": {
                "url": "https://www.gstatic.com/og/_/ss/k=og.mob.o3hu3mtmammu.L.W.O/m=md/excm=mih,mab,meb/d=1/ed=1/rs=AA2YrTsgcHY9rgal7Q_4KtT2B4QI4nDAcA"
              }
            },
            {
              "blockedResource": {
                "url": "https://www.gstatic.com/og/_/js/k=og.mob.en_US.09TQbv5ZB3k.O/rt=j/m=md/exm=mih,mab,meb/d=1/ed=1/rs=AA2YrTtYyrscNOyD60o4h8_Tc0H3-gaXUQ"
              }
            },
            {
              "blockedResource": {
                "url": "https://www.google.com/xjs/_/js/k=xjs.qs.en_US.JLMJY8f85DU.O/m=sx,c,sb_mob,bct,cdos,elog,hsm,jsa,mbsf,qim,r,qsm,d,csi/am=gCNop3GCBgwAWHU0S-wLCAEoBA/rt=j/d=1/t=zcms/rs=ACT90oHfJ0gcIaPuA4F8guH-oefRznVKvw"
              }
            }
          ]
        }'
        stub_request(:post, GoogleMobileFriendly::Request::GOOGLE_TEST_REQUEST_URI).
            with(query: {"key" => "api_key"}).
            to_return(:status => 200, :body => response, :headers => {})
      end

      let(:test_page) do
        GoogleMobileFriendly.run_test 'http://google.com', 'api_key'
      end

      it 'should be a TestPage object' do
        expect(test_page).to be_instance_of(GoogleMobileFriendly::TestPage)
      end

      it 'should has a response' do
        expect(test_page).to respond_to(:response)
      end

      context 'result' do
        it 'should be mobile friendly' do
          expect(test_page.is_mobile_friendly?).to be true
        end
        it 'should not have mobile issues' do
          expect(test_page.list_of_mobile_issues).to be_nil
        end
        it 'should have 3 blocked resourses' do
          expect(test_page.list_of_blocked_resources).to be_an_instance_of(Array)
          expect(test_page.list_of_blocked_resources.count).to eq(3)
        end
      end
    end

    context 'for not mobile friendly page' do
      before do
        response = '{
          "testStatus": {
            "status": "COMPLETE"
          },
          "mobileFriendliness": "NOT_MOBILE_FRIENDLY",
          "mobileFriendlyIssues": [
            {
              "rule": "TAP_TARGETS_TOO_CLOSE"
            },
            {
              "rule": "CONFIGURE_VIEWPORT"
            },
            {
              "rule": "USE_LEGIBLE_FONT_SIZES"
            }
          ]
        }'
        stub_request(:post, GoogleMobileFriendly::Request::GOOGLE_TEST_REQUEST_URI).
            with(query: {"key" => "api_key"}).
            to_return(:status => 200, :body => response, :headers => {})
      end

      let(:test_page) do
        GoogleMobileFriendly.run_test 'http://edition.cnn.com/EVENTS/1996/year.in.review/', 'api_key'
      end

      it 'should be a TestPage object' do
        expect(test_page).to be_instance_of(GoogleMobileFriendly::TestPage)
      end

      it 'should has a response' do
        expect(test_page).to respond_to(:response)
      end

      context 'result' do
        it 'should not be mobile friendly' do
          expect(test_page.is_mobile_friendly?).to be false
        end
        it 'should have 3 mobile issues with descriptions' do
          expect(test_page.list_of_mobile_issues).to be_an_instance_of(Array)
          expect(test_page.list_of_mobile_issues.count).to eq(3)

          expected_mobile_issues = GoogleMobileFriendly::ResponseData::MobileFriendlyIssue.constants.map do |issue|
            GoogleMobileFriendly::ResponseData::MobileFriendlyIssue.const_get issue
          end
          test_page.list_of_mobile_issues.each do |issue|
            expect(expected_mobile_issues).to include issue
          end
        end

        it 'should not have blocked resourses' do
          expect(test_page.list_of_blocked_resources).to be_nil
        end
      end

    end

    context 'for unreachable page' do
      before do
        response = '{
          "testStatus": {
            "status": "PAGE_UNREACHABLE"
          }
        }'
        stub_request(:post, GoogleMobileFriendly::Request::GOOGLE_TEST_REQUEST_URI).
            with(query: {"key" => "api_key"}).
            to_return(:status => 200, :body => response, :headers => {})
      end

      it 'should raise an error' do
        expect {
          GoogleMobileFriendly.run_test('unreachable-url', 'api_key')
        }.to raise_error(GoogleMobileFriendly::ResponseData::MobileFriendlyAPIError, GoogleMobileFriendly::ResponseData::TestStatus::PAGE_UNREACHABLE)
      end

    end
  end
end
