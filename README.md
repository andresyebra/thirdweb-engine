# Thirdweb Engine Ruby SDK

This Ruby SDK provides a convenient way to interact with the Thirdweb Engine API. Engine is an open-source, backend server that reads, writes, and deploys contracts at production scale.

## Documentation

For detailed API documentation, please visit: [Thirdweb API Documentation](https://thirdweb-engine.apidocumentation.com/reference)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thirdweb-engine'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install thirdweb-engine
```

## Configuration

Add the following configuration to `config/initializers/thirdweb.rb`:

```ruby
Thirdweb::Engine.configure do |config|
  config.base_url = "<your_host_base_url>" # default: "https://thirdweb-engine.apidocumentation.com"
  config.access_token = "<token>"
  config.network = "testnet"
  config.chain = "etherum"
  config.chain_id = "1"
  config.backend_wallet_address = "<backend_wallet_address>"
end
```

## Examples

### Deploying an NFT Collection

```ruby
metadata = {
  name: "My NFT Collection",
  symbol: "NFT",
  description: "My awesome NFT collection",
  image: "ipfs://QmciR3WLJsf2BgzTSjbG5zCxsrEQ8PqsHK7JWGWsDSNo46/nft.png",
  external_link: "https://example.com"
}

contract = Thirdweb::Engine::Deploy.nft_collection(metadata)
# => {
#      "result" => {
#        "queueId" => "61542a46-0e92-4d4b-a7d5-b532d5d169aa",
#        "deployedAddress" => "0x4C44583050CcE56617710CFd8Ef501B3C6cC3409"
#      }
#    }
```

### Minting an NFT

```ruby
result = Thirdweb::Engine::ERC721.mint(
  contract_address: "0x4C44583050CcE56617710CFd8Ef501B3C6cC3409",
  receiver: "0x2c2c2e82a0baf8a41429226f533e9b62f3640f8d",
  name: "My NFT",
  description: "My NFT description",
  image: "ipfs://QmciR3WLJsf2BgzTSjbG5zCxsrEQ8PqsHK7JWGWsDSNo46/nft.png"
)
# => {
#      "result" => {
#        "queueId" => "1c299615-b594-4bbf-8ed0-2e57ac2e5791"
#      }
#    }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andresyebra/thirdweb-engine. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/thirdweb-engine/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Thirdweb::Engine project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/thirdweb-engine/blob/master/CODE_OF_CONDUCT.md).
