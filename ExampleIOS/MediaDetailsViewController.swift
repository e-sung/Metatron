//
//  MediaDetailsViewController.swift
//  Metatron
//
//  Created by Almaz Ibragimov on 17.11.16.
//  Copyright © 2016 Almazrafi. All rights reserved.
//

import UIKit

import Metatron

class MediaDetailsViewController: UITableViewController {

    // MARK: Instance Properties

    var media: MPEGMedia?

    // MARK:

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var artistsField: UITextField!

    @IBOutlet weak var albumField: UITextField!
    @IBOutlet weak var genresField: UITextField!

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var bitRateLabel: UILabel!
    @IBOutlet weak var sampleRateLabel: UILabel!
    @IBOutlet weak var channelsLabel: UILabel!

    @IBOutlet weak var coverArtView: UIImageView!

    // MARK: Instance Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        if let media = self.media {
            if let image = UIImage(data: Data(media.coverArt.data)) {
                self.coverArtView.image = image
            } else {
                self.coverArtView.image = UIImage(named: "CoverArtField")
            }

            let seconds = Int(media.duration / 1000.0 + 0.5)

            self.durationLabel.text = String(format: "%d:%02d", seconds / 60, seconds % 60)

            switch media.bitRateMode {
            case MPEGBitRateMode.constant:
                self.bitRateLabel.text = String(format: "CBR %d", media.bitRate)
            case MPEGBitRateMode.variable:
                self.bitRateLabel.text = String(format: "VBR %d", media.bitRate)
            }

            self.sampleRateLabel.text = String(media.sampleRate)
            self.channelsLabel.text = String(media.channels)

            self.titleField.text = media.title
            self.artistsField.text = media.artists.joined(separator: " & ")

            self.albumField.text = media.album
            self.genresField.text = media.genres.joined(separator: "/")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ApplyMediaDetails" {
            if let media = self.media {
                media.title = self.titleField.text ?? ""
                media.artists = [self.artistsField.text ?? ""]

                media.album = self.albumField.text ?? ""
                media.genres = [self.genresField.text ?? ""]

                media.save()
            }
        }
    }
}