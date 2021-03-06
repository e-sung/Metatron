//
//  ID3v2TagLyricsTest.swift
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

class ID3v2TagLyricsTest: XCTestCase {

    // MARK: Instance Methods

    func test() {
    	let tag = ID3v2Tag()

    	do {
            let value = TagLyrics()

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff == nil)

            do {
                tag.version = ID3v2Version.v2

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = ID3v2Version.v3

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = ID3v2Version.v4

                XCTAssert(tag.toData() == nil)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == TagLyrics())
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("Abc 123")])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue == value.revised)
            XCTAssert(frame2.stuff == nil)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("Абв 123")])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue == value.revised)
            XCTAssert(frame2.stuff == nil)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("Abc 1"),
                                           TagLyrics.Piece("Abc 2")])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff(format: ID3v2SyncedLyricsFormat.regular).lyricsValue == value.revised)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("Abc 1", timeStamp: 1230),
                                           TagLyrics.Piece("Abc 2", timeStamp: 4560)])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff(format: ID3v2SyncedLyricsFormat.regular).lyricsValue == value.revised)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("Abc 1"),
                                           TagLyrics.Piece("Abc 2", timeStamp: 4560)])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff(format: ID3v2SyncedLyricsFormat.regular).lyricsValue == value.revised)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("Abc 1", timeStamp: 1230),
                                           TagLyrics.Piece("Abc 2")])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff(format: ID3v2SyncedLyricsFormat.regular).lyricsValue == value.revised)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("Abc 1", timeStamp: 4560),
                                           TagLyrics.Piece("Abc 2", timeStamp: 1230)])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff(format: ID3v2SyncedLyricsFormat.regular).lyricsValue == value.revised)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("", timeStamp: 1230),
                                           TagLyrics.Piece("Abc 2", timeStamp: 4560)])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff(format: ID3v2SyncedLyricsFormat.regular).lyricsValue == value.revised)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("", timeStamp: 4560),
                                           TagLyrics.Piece("Abc 2", timeStamp: 1230)])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff(format: ID3v2SyncedLyricsFormat.regular).lyricsValue == value.revised)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("Abc 1", timeStamp: 1230),
                                           TagLyrics.Piece("", timeStamp: 4560)])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff(format: ID3v2SyncedLyricsFormat.regular).lyricsValue == value.revised)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("Abc 1", timeStamp: 4560),
                                           TagLyrics.Piece("", timeStamp: 1230)])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff(format: ID3v2SyncedLyricsFormat.regular).lyricsValue == value.revised)

            do {
                tag.version = ID3v2Version.v2

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v3

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            do {
                tag.version = ID3v2Version.v4

                guard let data = tag.toData() else {
                    return XCTFail()
                }

                guard let other = ID3v2Tag(fromData: data) else {
                    return XCTFail()
                }

                XCTAssert(other.lyrics == value.revised)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("", timeStamp: 1230),
                                           TagLyrics.Piece("", timeStamp: 4560)])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff == nil)

            do {
                tag.version = ID3v2Version.v2

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = ID3v2Version.v3

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = ID3v2Version.v4

                XCTAssert(tag.toData() == nil)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let value = TagLyrics(pieces: [TagLyrics.Piece("", timeStamp: 4560),
                                           TagLyrics.Piece("", timeStamp: 1230)])

            tag.lyrics = value

            XCTAssert(tag.lyrics == value.revised)

            let frame1 = tag.appendFrameSet(ID3v2FrameID.uslt).mainFrame
            let frame2 = tag.appendFrameSet(ID3v2FrameID.sylt).mainFrame

            XCTAssert(frame1.stuff == nil)
            XCTAssert(frame2.stuff == nil)

            do {
                tag.version = ID3v2Version.v2

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = ID3v2Version.v3

                XCTAssert(tag.toData() == nil)
            }

            do {
                tag.version = ID3v2Version.v4

                XCTAssert(tag.toData() == nil)
            }

            frame1.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular).lyricsValue = value

            let stuff = frame2.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

            stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

            stuff.lyricsValue = value

            XCTAssert(tag.lyrics == value.revised)
        }

        do {
            let frameSet1 = tag.resetFrameSet(ID3v2FrameID.uslt)
            let frameSet2 = tag.resetFrameSet(ID3v2FrameID.sylt)

            do {
                XCTAssert(frameSet2.frames.count == 1)

                let stuff = frameSet1.mainFrame.imposeStuff(format: ID3v2UnsyncedLyricsFormat.regular)

                XCTAssert(frameSet2.frames.count == 1)

                stuff.lyricsValue = TagLyrics(pieces: [TagLyrics.Piece("Abc 1", timeStamp: 1230),
                                                       TagLyrics.Piece("Abc 2", timeStamp: 4560)])

                XCTAssert(tag.lyrics == TagLyrics(pieces: [TagLyrics.Piece("Abc 1\nAbc 2")]))
            }


            do {
                XCTAssert(frameSet2.frames.count == 1)

                let stuff = frameSet2.mainFrame.imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

                XCTAssert(frameSet2.frames.count == 1)

                stuff.contentType = ID3v2SyncedLyrics.ContentType.other

                stuff.lyricsValue = TagLyrics(pieces: [TagLyrics.Piece("Abc 1", timeStamp: 1230),
                                                       TagLyrics.Piece("Abc 2", timeStamp: 4560)])

                XCTAssert(tag.lyrics == TagLyrics(pieces: [TagLyrics.Piece("Abc 1\nAbc 2")]))
            }

            do {
                XCTAssert(frameSet2.frames.count == 1)

                let stuff = frameSet2.appendFrame().imposeStuff(format: ID3v2SyncedLyricsFormat.regular)

                XCTAssert(frameSet2.frames.count == 2)

                stuff.contentType = ID3v2SyncedLyrics.ContentType.lyrics

                stuff.lyricsValue = TagLyrics(pieces: [TagLyrics.Piece("Abc 1", timeStamp: 1230),
                                                       TagLyrics.Piece("Abc 2", timeStamp: 4560)])

                XCTAssert(tag.lyrics == TagLyrics(pieces: [TagLyrics.Piece("Abc 1", timeStamp: 1230),
                                                           TagLyrics.Piece("Abc 2", timeStamp: 4560)]))
            }
        }
    }
}
