//
//  ChargepointClient.m
//  GotCharge
//
//  Created by Hemen Chhatbar on 1/10/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "ChargepointClient.h"
#import <Foundation/Foundation.h>

@interface ChargepointClient()
@property(strong, nonatomic) NSXMLParser *parser;
@property(strong, nonatomic) NSString *element;
@property(strong, nonatomic) NSMutableData *webResponseData;
@property(strong, nonatomic) NSMutableArray *stationArray;
@property(strong, nonatomic) ChargeStation *currentStation;
@end
@implementation ChargepointClient



- (NSArray *)chargeStationsWithSuccess: (void (^)(NSArray *stations))success failure:(void (^)(NSError *error))failure {
    
    NSString *sSOAPMessage = @"<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://litwinconsulting.com/webservices/\">\n"
    "	<soap:Header>\n"
    "		<wsse:Security xmlns:wsse='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd' soap:mustUnderstand='1'>\n"
    "			<wsse:UsernameToken xmlns:wsu='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd' wsu:Id='UsernameToken-261'>\n"
    "				<wsse:Username>b207195d0b1684270db5aeae7970408c5179ce9f5a4dc1366937247</wsse:Username>\n"
    "				<wsse:Password Type='http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'>167fb3e18980d8622f6a19fbbda3e01d</wsse:Password>\n"
    "			</wsse:UsernameToken>\n"
    "		</wsse:Security>\n"
    "   </soap:Header>\n"
    "   <soap:Body>\n"
    "		<ns2:getPublicStations xmlns:ns2='http://www.example.org/coulombservices/'>\n"
    "			<searchQuery>\n"
    "				<Proximity>10</Proximity>\n"
    "				<proximityUnit>M</proximityUnit>\n"
    "				<Geo>\n"
    "					<Lat>37.425758</Lat>\n"
    "					<Long>-122.097807</Long>\n"
    "				</Geo>\n"
    "			</searchQuery>\n"
    "		</ns2:getPublicStations>\n"
    "   </soap:Body>\n"
    "  </soap:Envelope>\n";
    
    
        NSURL *sRequestURL = [NSURL URLWithString:@"https://webservices.chargepoint.com/webservices/chargepoint/services/4.1"];
        NSMutableURLRequest *myRequest = [NSMutableURLRequest requestWithURL:sRequestURL];
        NSString *sMessageLength = [NSString stringWithFormat:@"%lu", (unsigned long)[sSOAPMessage length]];
        
        [myRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [myRequest addValue: @"urn:provider/interface/chargepointservices/getPublicStations" forHTTPHeaderField:@"SOAPAction"];
        [myRequest addValue: sMessageLength forHTTPHeaderField:@"Content-Length"];
        [myRequest setHTTPMethod:@"POST"];
        [myRequest setHTTPBody: [sSOAPMessage dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:myRequest delegate:self];
        
        if( theConnection ) {
        self.webResponseData = [NSMutableData data];
        

        }else {
        NSLog(@"Some error occurred in Connection");
        
    }
    
    return self.stationArray;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.webResponseData  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.webResponseData  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Some error in your Connection. Please try again.");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Received Bytes from server: %lu", (unsigned long)[self.webResponseData length]);
    NSString *myXMLResponse = [[NSString alloc] initWithBytes: [self.webResponseData bytes] length:[self.webResponseData length] encoding:NSUTF8StringEncoding];
    //  NSLog(@"%@",myXMLResponse);
    // NSData *
    
    self.parser = [[NSXMLParser alloc] initWithData:self.webResponseData];
    [self.parser setDelegate:self];
    [self.parser setShouldResolveExternalEntities:NO];
    [self.parser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    self.element = elementName;
    
    if ([self.element isEqualToString:@"stationData"]) {
        self.currentStation = [[ChargeStation alloc] init];
        /*self.item    = [[NSMutableDictionary alloc] init];
        self.title   = [[NSMutableString alloc] init];
        self.link    = [[NSMutableString alloc] init];*/
        
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"stationData"]) {
        
        /* [self.item setObject:title forKey:@"title"];
         [self.item setObject:link forKey:@"link"];
         
         [feeds addObject:[self.item copy]];*/
        [self.stationArray addObject:self.currentStation];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([self.element isEqualToString:@"Address"]) {
        //[title appendString:string];
        self.currentStation.address = string;
        NSLog(@"Address: %@", string);
    } else if ([self.element isEqualToString:@"stationName"]) {
        self.currentStation.stationName = string;
        NSLog(@"Station Name: %@", string);
        //[link appendString:string];
    }
    else if ([self.element isEqualToString:@"Lat"]) {
        self.currentStation.latitude = [string doubleValue];
        NSLog(@"Lat: %@", string);
        //[link appendString:string];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    NSLog(@"parser end");
    
}


@end
