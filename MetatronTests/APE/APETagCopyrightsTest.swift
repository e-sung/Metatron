//
//  APETagCopyrightsTest.swift
//  Metatron
//
//  Created by Almaz Ibragimov on 15.09.16.
//  Copyright © 2016 Almazrafi. All rights reserved.
//

import XCTest

@testable import Metatron

class APETagCopyrightsTest: XCTestCase {

    // MARK: Instance Methods

    func test() {
        let tag = APETag()

        do {
            let value: [String] = []

            tag.copyrights = value

            XCTAssert(tag.copyrights == value)

            XCTAssert(tag["Copyright"] == nil)

            do {
                tag.version = APEVersion.v1

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = APEVersion.v2

                XCTAssert(tag.toData() == nil)
            }

            guard let item = tag.appendItem("Copyright") else {
                return XCTFail()
            }

            item.stringListValue = value

            XCTAssert(tag.copyrights == value)
        }

        do {
            let value = [""]

            tag.copyrights = value

            XCTAssert(tag.copyrights == [])

            XCTAssert(tag["Copyright"] == nil)

            do {
                tag.version = APEVersion.v1

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = APEVersion.v2

                XCTAssert(tag.toData() == nil)
            }

            guard let item = tag.appendItem("Copyright") else {
                return XCTFail()
            }

            item.stringListValue = value

            XCTAssert(tag.copyrights == [])
        }

        do {
            let value = ["Abc 123"]

            tag.copyrights = value

            XCTAssert(tag.copyrights == value)

            guard let item = tag["Copyright"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == value)

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == value)
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == value)
            }

            item.stringListValue = value

            XCTAssert(tag.copyrights == value)
        }

        do {
            let value = ["Абв 123"]

            tag.copyrights = value

            XCTAssert(tag.copyrights == value)

            guard let item = tag["Copyright"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == value)

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == value)
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == value)
            }

            item.stringListValue = value

            XCTAssert(tag.copyrights == value)
        }

        do {
            let value = ["Abc 1", "Abc 2"]

            tag.copyrights = value

            XCTAssert(tag.copyrights == value)

            guard let item = tag["Copyright"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == value)

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == value)
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == value)
            }

            item.stringListValue = value

            XCTAssert(tag.copyrights == value)
        }

        do {
            let value = ["", "Abc 2"]

            tag.copyrights = value

            XCTAssert(tag.copyrights == ["Abc 2"])

            guard let item = tag["Copyright"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == ["Abc 2"])

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == ["Abc 2"])
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == ["Abc 2"])
            }

            item.stringListValue = value

            XCTAssert(tag.copyrights == ["Abc 2"])
        }

        do {
            let value = ["Abc 1", ""]

            tag.copyrights = value

            XCTAssert(tag.copyrights == ["Abc 1"])

            guard let item = tag["Copyright"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == ["Abc 1"])

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == ["Abc 1"])
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == ["Abc 1"])
            }

            item.stringListValue = value

            XCTAssert(tag.copyrights == ["Abc 1"])
        }

        do {
            let value = ["", ""]

            tag.copyrights = value

            XCTAssert(tag.copyrights == [])

            XCTAssert(tag["Copyright"] == nil)

            do {
                tag.version = APEVersion.v1

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = APEVersion.v2

                XCTAssert(tag.toData() == nil)
            }

            guard let item = tag.appendItem("Copyright") else {
                return XCTFail()
            }

            item.stringListValue = value

            XCTAssert(tag.copyrights == [])
        }

        do {
            let value = [Array<String>(repeating: "Abc", count: 123).joined(separator: "\n")]

            tag.copyrights = value

            XCTAssert(tag.copyrights == value)

            guard let item = tag["Copyright"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == value)

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == value)
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == value)
            }

            item.stringListValue = value

            XCTAssert(tag.copyrights == value)
        }

        do {
            let value = Array<String>(repeating: "Abc", count: 123)

            tag.copyrights = value

            XCTAssert(tag.copyrights == value)

            guard let item = tag["Copyright"] else {
                return XCTFail()
            }

            guard let itemValue = item.stringListValue else {
                return XCTFail()
            }

            XCTAssert(itemValue == value)

            do {
                tag.version = APEVersion.v1

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == value)
            }

            do {
                tag.version = APEVersion.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = APETag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.copyrights == value)
            }

            item.stringListValue = value

            XCTAssert(tag.copyrights == value)
        }

        guard let item = tag.appendItem("Copyright") else {
            return XCTFail()
        }

        do {
            item.value = [UInt8](String("Abc 1\0Abc 2").utf8)

            XCTAssert(tag.copyrights == ["Abc 1", "Abc 2"])
        }

        do {
            item.value = [UInt8](String("\0Abc 2").utf8)

            XCTAssert(tag.copyrights == ["Abc 2"])
        }

        do {
            item.value = [UInt8](String("Abc 1\0").utf8)

            XCTAssert(tag.copyrights == ["Abc 1"])
        }

        do {
            item.value = [0]

            XCTAssert(tag.copyrights == [])
        }
    }
}