#!/bin/bash

wg-quick up wg0
systemctl enable wg-quick@wg0
