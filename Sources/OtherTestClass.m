
@implementation OtherTestClass

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if (self) {
		self.name = [dictionary objectForKey:@"available_balance"];
		self.surname = [dictionary ml_objectForKey:@"available_balance"];
	}
	return self;
}

@end
