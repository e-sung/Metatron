//
//  Lyrics3UnknownValueTest.swift
//  Metatron
//
//  Copyright (c) 2016 Almaz Ibragimov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import XCTest

@testable import Metatron

class Lyrics3UnknownValueTest: XCTestCase {

    // MARK: Instance Methods

    func testCreateClone() {
        let stuff = Lyrics3UnknownValue()

        stuff.content = [1, 2, 3, 4]

        let other = Lyrics3UnknownValueFormat.regular.createStuffSubclass(fromOther: stuff)

        XCTAssert(other.content == stuff.content)
    }

    func testImposeStuff() {
        let field = Lyrics3Field(identifier: Lyrics3FieldID.lyr)

        let stuff1 = field.imposeStuff(format: Lyrics3UnknownValueFormat.regular)
        let stuff2 = field.imposeStuff(format: Lyrics3UnknownValueFormat.regular)

        XCTAssert(field.stuff is Lyrics3UnknownValue)

        XCTAssert(field.stuff === stuff1)
        XCTAssert(field.stuff === stuff2)
    }

    // MARK:

    func testCaseA() {
        let stuff = Lyrics3UnknownValue()

        stuff.content = [1, 2, 3, 4]

        XCTAssert(!stuff.isEmpty)

        guard let data = stuff.toData() else {
            return XCTFail()
        }

        XCTAssert(!data.isEmpty)

        let other = Lyrics3UnknownValue(fromData: data)

        XCTAssert(!stuff.isEmpty)

        XCTAssert(other.content == stuff.content)
    }

    func testCaseB() {
        let stuff = Lyrics3UnknownValue()

        stuff.content = []

        XCTAssert(stuff.isEmpty)

        XCTAssert(stuff.toData() == nil)
    }

    func testCaseC() {
        let stuff = Lyrics3UnknownValue(fromData: [])

        XCTAssert(stuff.isEmpty)

        XCTAssert(stuff.content == [])

        XCTAssert(stuff.toData() == nil)
    }
}
